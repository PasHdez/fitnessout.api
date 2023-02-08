import { Router } from "express";
import ExerciseController from "@controllers/exercise.controller";
import { Routes } from "@interfaces/routes.interface";

class ExerciseRoute implements Routes {
  public path = "/exercises";
  public router = Router();
  public exerciseController = new ExerciseController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(
      `${this.path}/:id`,
      this.exerciseController.getExerciseById
    );

    this.router.post(`${this.path}`, this.exerciseController.addExercise);
  }
}

export default ExerciseRoute;
