// ---------------- Render background grid ----------------

void renderGrid() {
    GridLine xLine;
    GridLine yLine;
    stroke(darkStroke);
    for (int x = 0; x < width; x += gridSkip) {
        xLine = new GridLine(x, "x");
        xLine.render();
        for (int y = 0; y < height; y += gridSkip) {
            yLine = new GridLine(y, "y");
            yLine.render();
        }
    }
}

// --------------------------------------------------------


// ------------ Populate flow-field array list ------------

void populateFlowFieldArrayList() {
    int maxDistance = 50;
    float minSpawnPositionX = mouseX - maxDistance;
    float maxSpawnPositionX = mouseX + maxDistance;
    float minSpawnPositionY = mouseY - maxDistance;
    float maxSpawnPositionY = mouseY + maxDistance;
    float spawnX, spawnY;
    for (int i = 0; i < studentCount; i++) {
        spawnX = random(minSpawnPositionX, maxSpawnPositionX);
        spawnY = random(minSpawnPositionY, maxSpawnPositionY);
        Particle p = new Particle(spawnX, spawnY);
        particles.add(p);
    }
}

// --------------------------------------------------------


// ----------- Handle flow-field spawn interval -----------

void handleSpawnInterval() {
    if (
        millis() > time + interval &&
        mousePressed
    ) {
        time = millis();
        populateFlowFieldArrayList();
    }
}

// --------------------------------------------------------


// ------------- Update flow-field particles --------------

void updateParticles() {
    PVector mouse = new PVector(mouseX, mouseY);
    for (Particle p: particles) {
        p.follow(mouse);
        p.update();
        p.render();
    }
}

// --------------------------------------------------------


// -------------------- Reset program ---------------------

void reset() {
    background(backgroundColor);
    renderGrid();
    for (int i = particles.size() - 1; i >= 0; i--) {
        particles.remove(i);
    }
}

// --------------------------------------------------------


// --------------- Update flow-field color ----------------

void updateFieldColor() {
    colorMode(HSB, 360, 255, 255);
    float colorMap = map(mouseX, 0, width, 0, 360);
    int floorVal = floor(colorMap);
    currentFieldColor = color(floorVal, 255, 255);
    currentHue = floorVal;
    colorMode(RGB);
}

// --------------------------------------------------------


// ---------------- Get random array index ----------------

String[] getRandomIndex(String[][] array) {
    float randomNum = random(0, array.length - 1);
    int floorVal = floor(randomNum);
    String[] index = array[floorVal];
    return index;
}

// --------------------------------------------------------


// ---------------------- Set quote -----------------------

void setQuote(String[][] array, color c, PFont f) {
    String[] newQuote = getRandomIndex(array);
    currentCategoryFill = c;
    currentFont = f;
    quote = newQuote[0];
    author = newQuote[1];
}

// --------------------------------------------------------


// --------------------- Update quote ---------------------

void updateQuotes() {
    if (millis() > textTime + interval) {
        if (currentHue <= 289 && currentHue >= 180) {
            setQuote(tech, techBlue, orbitron);
        } else if (currentHue <= 179 && currentHue >= 70) {
            setQuote(UX, uxGreen, robotoSlab);
        } else if (currentHue <= 69 && currentHue >= 40) {
            setQuote(designThinking, designThinkingYellow, montserrat);
        } else {
            setQuote(communication, visualCommunicationRed, cormorant);
        }
        textTime = millis();
    }
}

// --------------------------------------------------------


// --------------------- Render quote ---------------------

void renderQuotes() {
    updateQuotes();
    if (particles.size() > 0) {
        quoteLayer.beginDraw();
        quoteLayer.background(backgroundColor);
        quoteLayer.fill(currentCategoryFill);
        quoteLayer.textAlign(CENTER);
        quoteLayer.textFont(currentFont);
        quoteLayer.text(
            quote,
            quoteLayer.width / 2,
            quoteLayer.height / 2
        );
        quoteLayer.textFont(lato);
        quoteLayer.fill(offWhite);
        quoteLayer.text(
            author,
            quoteLayer.width / 2,
            quoteLayer.height / 2 + 25
        );
        quoteLayer.endDraw();
        imageMode(CENTER);
        image(
            quoteLayer,
            width / 2,
            height / 2
        );
    }
}

// --------------------------------------------------------


// ---------------- Assign category colors ----------------

void assignCategoryColors() {
    if (currentHue <= 289 && currentHue >= 180) {
        glowingGridStroke = techBlue;
        updateLegnedColors("Technology", techBlue);
    } else if (currentHue <= 179 && currentHue >= 70) {
        glowingGridStroke = uxGreen;
        updateLegnedColors("User Experience", uxGreen);
    } else if (currentHue <= 69 && currentHue >= 40) {
        glowingGridStroke = designThinkingYellow;
        updateLegnedColors("Design Thinking", designThinkingYellow);
    } else {
        glowingGridStroke = visualCommunicationRed;
        updateLegnedColors("Visual Communication", visualCommunicationRed);
    }
}

// --------------------------------------------------------


// ------------------ Assign legend -----------------------

void assignLegend() {
    float inc = legendLayer.width / 8;
    if (!legendWasAssigned) {
        legendKeys[0] = new LegendKey(inc, "Visual Communication", offWhite, false);
        legendKeys[1] = new LegendKey(inc * 3, "Design Thinking", offWhite, false);
        legendKeys[2] = new LegendKey(inc * 5, "User Experience", offWhite, false);
        legendKeys[3] = new LegendKey(inc * 7, "Technology", offWhite, false);
        legendWasAssigned = true;
    }
}

// --------------------------------------------------------


// -------------------- Render legend ---------------------

void renderLegend() {
    assignLegend();

    legendLayer.beginDraw();
    legendLayer.background(backgroundColor);
    legendLayer.endDraw();
    imageMode(CORNER);

    if (particles.size() > 0) {
        image(legendLayer, 0, height - legendLayer.height);
        for (LegendKey k: legendKeys) {
            k.render();
        }
    }
}

// --------------------------------------------------------


// --------------- Update legend colors -------------------

void updateLegnedColors(String name, color c) {
    for (LegendKey k: legendKeys) {
        if (k.value == name) {
            k.fillColor = c;
            k.underlined = true;
        } else {
            k.fillColor = offWhite;
            k.underlined = false;
        }
    }
}

// --------------------------------------------------------
