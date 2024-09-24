function StateMachine() constructor {
    static nullState = new State();

    state = nullState;
    time = 0;

    // Swap to a new state
    swap = function(_state = nullState) {
        state.destroy();

        state = _state;
        time = 0;

        state.create();
    }

    // Run current state
    run = function() {
        state.update();
        time++;
    }
}

function State() constructor {
    static NOOP = function() { };

    create = NOOP;
    update = NOOP;
    destroy = NOOP;
}