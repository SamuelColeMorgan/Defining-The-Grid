// --------------------- Setup sketch ---------------------

void setup() {
    size(1280, 720, P2D);
    background(backgroundColor);

    quoteLayer = createGraphics(
        floor(gridSkip * 20),
        floor(gridSkip * 2 + 1)
    );
    legendLayer = createGraphics(width, 50);

    cormorant = createFont("fonts/cormorant/Cormorant-Bold.otf", 25);
    lato = createFont("fonts/lato/Lato-Regular.ttf", 15);
    montserrat = createFont("fonts/montserrat/Montserrat-Regular.otf", 20);
    orbitron = createFont("fonts/orbitron/orbitron-medium.otf", 18);
    robotoSlab = createFont("fonts/roboto-slab/RobotoSlab-Regular.ttf", 20);
}

// --------------------------------------------------------


// ----------------- Mouse release event ------------------

void mouseReleased() {
    reset();
}

// --------------------------------------------------------


// -------------------- Update sketch ---------------------

void draw() {
    renderGrid();
    updateParticles();
    handleSpawnInterval();
    updateFieldColor();
    renderQuotes();
    renderLegend();
    assignCategoryColors();
}

// --------------------------------------------------------
