import { Exercise } from "@prisma/client";
import { prismaClient } from "@/prisma";
import { CreateExerciseDto } from "@dtos/exercise.dto";
import ExerciseCategoryService from "@services/exerciseCategory.service";
import MuscleGroupService from "@services/muscleGroup.service";
import { HttpException } from "@/exceptions/HttpException";

class ExerciseService {
  public exercises = prismaClient.exercise;
  async getExerciseById(id: number): Promise<Exercise> {
    const exercise = await this.exercises.findUnique({
      where: {
        id: id,
      },
    });
    return exercise;
  }

  async addExercise(exercise: CreateExerciseDto): Promise<Exercise> {
    const findExercise = await this.exercises.findFirst({
      where: {
        name: exercise.name,
      },
    });
    if (findExercise) {
      throw new HttpException(
        409,
        `Exercise with name ${exercise.name} already exists`
      );
    }
    const findMuscleGroups = await new MuscleGroupService().addMuscleGroups(
      exercise.muscleGroups
    );
    const exerciseCategories =
      await new ExerciseCategoryService().addCategories(exercise.categories);

    const newExercise = await this.exercises.create({
      data: {
        ...exercise,
        muscleGroups: {
          connect: findMuscleGroups.map((muscleGroup) => ({
            id: muscleGroup.id,
          })),
        },
        categories: {
          connect: exerciseCategories.map((exerciseCategory) => ({
            id: exerciseCategory.id,
          })),
        },
      },
    });
    return newExercise;
  }
}

export default ExerciseService;
