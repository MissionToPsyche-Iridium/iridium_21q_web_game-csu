/*
    Improved CRT Shader for Godot - Fixes Black Tint
*/
shader_type canvas_item;

// Screen texture
uniform sampler2D screen_texture : hint_screen_texture;

// CRT curvature (0 = flat, higher = more curve)
uniform float crt_curve : hint_range( 0.0, 1.0 ) = 0.01;

// Scan line intensity (lower = softer lines)
uniform float crt_scan_line_color : hint_range( 0.0, 1.0 ) = 0.1;

// Aperture grille effect (color separation)
uniform float aperture_grille_rate : hint_range( 0.0, 1.0 ) = 0.2;

// Adjusted brightness of aperture grille effect
uniform float aperture_grille_cut_rate : hint_range( 0.0, 1.0 ) = 0.6;

// RF signal blur (keeping the same)
uniform float rf_switch_esque_blur : hint_range( 0.0, 1.0 ) = 1.0;

// White noise (static effect, 0 = off)
uniform float white_noise_rate : hint_range( 0.0, 1.0 ) = 0.05;

// Function to generate random noise
float random(vec2 pos) { 
    return fract(sin(dot(pos, vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    // CRT curve distortion
    vec2 crt_curve_shift = (vec2(1.0, 1.0) - sin(UV.yx * PI)) * crt_curve;
    vec2 crt_curve_scale = vec2(1.0, 1.0) + crt_curve_shift * 2.0;
    vec2 fixed_uv = SCREEN_UV * crt_curve_scale - crt_curve_shift;

    // Ensure color remains within screen bounds
    float enable_color = float(0.0 <= fixed_uv.x && fixed_uv.x <= 1.0 && 0.0 <= fixed_uv.y && fixed_uv.y <= 1.0);

    // Get original pixel color
    vec3 original_color = texture(screen_texture, fixed_uv).rgb;

    // Apply RF blur (kept the same)
    COLOR.rgb = (
        (original_color * (1.0 - rf_switch_esque_blur * 0.5))
        + (
            (texture(screen_texture, fixed_uv + vec2(-SCREEN_PIXEL_SIZE.x * 1.5, 0.0)).rgb
            + texture(screen_texture, fixed_uv + vec2(SCREEN_PIXEL_SIZE.x * 1.5, 0.0)).rgb) * (rf_switch_esque_blur * 0.25)
        )
    ) * enable_color;
    COLOR.a = 1.0;

    // White noise effect (subtle)
    float white_noise = random(UV + vec2(sin(TIME * 0.5), cos(TIME * 0.25)));
    COLOR.rgb = mix(COLOR.rgb, vec3(white_noise), white_noise_rate * enable_color);

    // Aperture grille effect (reduced for better brightness)
    float aperture_grille_point = mod((SCREEN_UV.x * crt_curve_scale.x - crt_curve_shift.x) / SCREEN_PIXEL_SIZE.x, 3.0);
    float aperture_grille_r_rate = clamp(1.0 - aperture_grille_point, 0.0, 1.0) + clamp(aperture_grille_point - 2.0, 0.0, 1.0);
    float aperture_grille_g_rate = clamp(1.0 - abs(1.0 - aperture_grille_point), 0.0, 1.0);
    float aperture_grille_b_rate = 1.0 - aperture_grille_r_rate - aperture_grille_g_rate;
    
    // **Fixing the black tint by boosting brightness**
    COLOR *= vec4(
        vec3(
            clamp(aperture_grille_r_rate, aperture_grille_rate, 1.0),
            clamp(aperture_grille_g_rate, aperture_grille_rate, 1.0),
            clamp(aperture_grille_b_rate, aperture_grille_rate, 1.0)
        ) * aperture_grille_cut_rate + 0.6, // **Increased brightness**
        1.0
    );

    // Softer scan lines to prevent over-darkening
    COLOR = mix(COLOR, vec4(0.3, 0.3, 0.3, 1.0), float(0 == int(fixed_uv.y / SCREEN_PIXEL_SIZE.y) % 2) * crt_scan_line_color);
}