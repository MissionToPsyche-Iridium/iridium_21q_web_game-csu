extends Node
#Contains dictionary of information on the PSYCHE mission and every ore, stat, and item in the game

#Contains information on each ore
@export var oreInfo = {
	"Cinnabar": "Composition:\nHgS\n\nDescription:\nMercuric Sulfide, commonly reffered to as Cinnabar, is known for its reddish color. The mineral is often used as a pigemnt as well as medicinal uses, though it has seen a decline in those uses due to its toxicity. Cinnabar is the most common ore containing Mercury and is used to extract the metal. It is commonly encountered with pyrite, marcasite, and stibnite in veins near recent volcanic rocks and in hot-springs deposits. Metacinnabar, the isometric (cubic) form of cinnabar, transforms to cinnabar upon heating to 400°–550° C (750°–1,020° F).\n\nSource:\nThe Editors of Encyclopaedia Britannica (2025, March 12). cinnabar. Encyclopedia Britannica. https://www.britannica.com/science/cinnabar",
	"Cobalt":	"Symbol:\nCo\n\nAtomic Number:\n27\n\nAtomic Mass:\n58.933u\n\nDescription:\nCobalt, is a hard silvery-white metal that often resembles iron and nickel.\nThe metal has many practical uses including the creation of rechargeable batteries, the production of jet engines, and a pigment for the color blue.\n\nSource:\nNational Center for Biotechnology Information (2025). PubChem Element Summary for AtomicNumber 27, Cobalt. Retrieved April 5, 2025 from https://pubchem.ncbi.nlm.nih.gov/element/Cobalt.",
	"Copper":	"Symbol:\nCu\n\nAtomic Number:\n29\n\nAtomic Mass:\n63.546u\n\nDescription:\nCopper, is reddish and takes on a bright metallic luster. It is malleable, ductile, and a good conductor of heat and electricity. Used in large amounts by the electrical industry in the form of wire.\n\nSource:\nNational Center for Biotechnology Information (2025). PubChem Element Summary for AtomicNumber 29, Copper. Retrieved April 5, 2025 from https://pubchem.ncbi.nlm.nih.gov/element/Copper.",
	"Iron":		"Symbol:\nFe\n\nAtomic Number:\n26\n\nAtomic Mass:\n55.845u\n\nDescription:\nIron, is a hard, brittle, pure metal used to create other alloys such as steel. It is very reactive chemically and rapidly corrodes, especially in moist air or at elevated temperatures. Aside from the creation of steel, iron also plays a key role in keeping plants and animals alive by carrying oxygen through them.\n\nSource:\nNational Center for Biotechnology Information (2025). PubChem Element Summary for AtomicNumber 26, Iron. Retrieved April 5, 2025 from https://pubchem.ncbi.nlm.nih.gov/element/Iron.",
	"Gold":		"Symbol:\nAu\n\nAtomic Number:\n79\n\nAtomic Mass:\n196.97u\n\nDescription:\nGold, when divided, will often take on a black, ruby, or purple color, but when in a large enough mass it will gain its iconic yellow-ish color. Gold is the most malleable and ductile of all known metals. It is used in coinage and is a standard for monetary systems in many countries. It is also used for coating certain space satellites, as it is a good reflector of infrared and is inert.\n\nSource:\nNational Center for Biotechnology Information (2025). PubChem Element Summary for AtomicNumber 79, Gold. Retrieved April 5, 2025 from https://pubchem.ncbi.nlm.nih.gov/element/Gold.",
}

#Contains information each stat
@export var	statInfo = {
	"Grabber Cooldown": "Description:\nNumber of frames inbetween grabs.",
	"Grabber Speed": "Description:\nHow fast the grabber moves when grabbing something.",
	"Grabber Range": "Description:\nHow big the radius for the grabber is.",
	"Drill Speed": "Description:\nDamage dealt to block every second.",
	"Drill Power": "Description:\nHow effected a drill is by harder blocks.",
	"Drone Speed": "Description:\nHow fast the drone moves.",
	"Luck": "Description:\nHow lucky the drone is for events.",
	"Tube Speed": "Description:\nTime between objects leaving the drone and entering the mothership.",
}

#Contains information on each item. Gets filled on item block creation and called on mouse hover
@export var itemInfo = {}
@export var itemEffects = {}
