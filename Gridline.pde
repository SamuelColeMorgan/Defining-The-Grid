class GridLine {
    float pos;
    String type;

    GridLine(float p, String t) {
        pos = p;
        type = t;
    }

    color currentColor() {
        float getDistance = abs(type == "x" ? mouseX - pos : mouseY - pos);
        float mapDistance = map(getDistance, 0, gridSkip, 0, 1);
        color lerpedColor = lerpColor(glowingGridStroke, darkStroke, mapDistance);
        return mousePressed ? lerpedColor : darkStroke;
    }

    void render() {
        stroke(currentColor());
        switch (type) {
            case "x":
                line(pos, 0, pos, height);
                break;
            case "y":
                line(0, pos, width, pos);
                break;
            default:
                break;
        }
    }

}
