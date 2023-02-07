import { NextFunction, Request, Response } from "express";
import ExerciseService from "@services/exercise.service";
import { CreateExerciseDto } from "@/dtos/exercise.dto";

class ExerciseController {
  public exerciseService = new ExerciseService();
  public getExerciseById = (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const { id } = req.params;
      const exercise = this.exerciseService.getExerciseById(Number(id));
      if (!exercise) {
        res.sendStatus(404);
        return;
      }

      res.json(exercise);
    } catch (error) {
      next(error);
    }
  };

  public addExercise = async (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const exerciseData: CreateExerciseDto = req.body;
      const exercise = await this.exerciseService.addExercise(exerciseData);
      if (!exercise) {
        res.sendStatus(400);
        return;
      }
      res.json(exercise);
    } catch (error) {
      next(error);
    }
  };
}

export default ExerciseController;
