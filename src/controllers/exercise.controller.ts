import { NextFunction, Request, Response } from "express";
import ExerciseService from "@services/exercise.service";

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
      res.json({ message: "Hello World!", id, ...exercise });
    } catch (error) {
      next(error);
    }
  };
}

export default ExerciseController;
