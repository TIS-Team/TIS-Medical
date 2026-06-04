class ACE_Medical_Treatment {

    class Painkillers;
    class Tisuprom: Painkillers {
        painReduce = 0.85; // Slightly better than morphine

        // More like painkillers
        hrIncreaseLow[] = {-7, -15};
        hrIncreaseNormal[] = {-7, -20};
        hrIncreaseHigh[] = {-7, -25};
        timeInSystem = 1000;
        timeTillMaxEffect = 30;
        maxDose = 4;
        dose = 1;
        incompatibleMedication[] = {};
        viscosityChange = -10;
    };
};
