class LegendKey {
    float xPos;
    String value;
    color fillColor;
    boolean underlined;

    LegendKey(float x, String v, color c, boolean u) {
        xPos = x;
        value = v;
        fillColor = c;
        underlined = u;
    }

    void render() {
        legendLayer.beginDraw();
        legendLayer.textAlign(CENTER);
        legendLayer.textFont(lato);
        legendLayer.fill(fillColor);
        legendLayer.text(
            value,
            xPos,
            legendLayer.height / 2 + 5
        );
        if (underlined) {
            legendLayer.pushMatrix();
            legendLayer.translate(0, 3);
            legendLayer.noStroke();
            legendLayer.rectMode(CENTER);
            legendLayer.rect(
                xPos,
                legendLayer.height - 6,
                legendLayer.width / 4,
                6
            );
            legendLayer.popMatrix();
        }
        legendLayer.endDraw();
    }
}
