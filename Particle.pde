/*

    NOTE:
    
    The steering algorithm for this project was written with the assistance of
    "The Nature of Code" by Daniel Shiffman.
    
    URL: natureofcode.com/book/chapter-6-autonomous-agents/

*/


class Particle {
    PVector position;
    PVector velocity;
    PVector acceleration;
    PVector lastPos;
    float maxSpeed = 5;
    float maxForce = 0.2;
    float opacity = 10;

    Particle(float x, float y) {
        position = new PVector(x, y);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        lastPos = new PVector(position.x, position.y);
    }

    void follow(PVector target) {
        PVector desired = PVector.sub(target, position);
        desired.setMag(maxSpeed);
        PVector steer = PVector.sub(desired, velocity);
        steer.limit(maxForce);
        applyForce(steer);
    }

    void applyForce(PVector force) {
        acceleration.add(force);
    }

    void update() {
        velocity.add(acceleration);
        velocity.limit(maxSpeed);
        position.add(velocity);
        acceleration.mult(0);
    }

    void updateLastPos() {
        lastPos.x = position.x;
        lastPos.y = position.y;
    }

    void render() {
        stroke(currentFieldColor, opacity);
        strokeWeight(1);
        line(
            position.x,
            position.y,
            lastPos.x,
            lastPos.y
        );
        updateLastPos();
    }
}
