// ------------------------ Fonts -------------------------

PFont cormorant, lato, montserrat, orbitron, robotoSlab;
PFont currentFont;

// --------------------------------------------------------


// ------------------- Graphics layers --------------------

PGraphics quoteLayer;
PGraphics legendLayer;

// --------------------------------------------------------


// ----------------------- PVectors -----------------------

PVector handPosition;

// --------------------------------------------------------


// -------------------- Ints & floats ---------------------

int time = millis();
int textTime = millis();
int soundTime = millis();
int soundInterval = 100;
int interval = 5000;
int studentCount = 500;

float currentHue;

float zoff = 0;
float gridSkip = 40;

float colorAngle = 0;
float colorVelocity = 0;
float colorAcceleration = 0.001;

float waveAngle = 0;
float waveVelocity = 0;
float waveAcceleration = 0.001;

// --------------------------------------------------------


// ----------------------- Strings ------------------------

String quote, author;

// --------------------------------------------------------


// ----------------------- Booleans -----------------------

boolean legendWasAssigned = false;

// --------------------------------------------------------


// -------------------- Arrays & lists --------------------

LegendKey[] legendKeys = new LegendKey[4];
ArrayList < Particle > particles = new ArrayList < Particle > ();

// --------------------------------------------------------


// ------------------------ Colors ------------------------

color currentFieldColor;
color offWhite = #fefefe;
color backgroundColor = color(5, 15, 40);
color darkStroke = color(10, 50, 90);
color glowingGridStroke;
color currentCategoryFill;

color techBlue = color(10, 195, 255);
color uxGreen = color(150, 220, 5);
color designThinkingYellow = color(240, 210, 50);
color visualCommunicationRed = color(220, 50, 50);

// --------------------------------------------------------
