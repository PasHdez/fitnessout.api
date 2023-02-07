import { MuscleGroup } from "@prisma/client";
import { prismaClient } from "@/prisma";
import { CreateMuscleGroupDto } from "@/dtos/muscleGroup.dto";

class MuscleGroupService {
  public muscleGroups = prismaClient.muscleGroup;

  async getMuscleGroupById(id: number): Promise<MuscleGroup> {
    const muscleGroup = await this.muscleGroups.findUnique({
      where: {
        id: id,
      },
    });
    return muscleGroup;
  }

  async addMuscleGroups(
    muscleGroups: CreateMuscleGroupDto[]
  ): Promise<MuscleGroup[]> {
    const findMuscleGroups = await this.muscleGroups.findMany({
      where: {
        name: {
          in: muscleGroups.map((muscleGroup) => muscleGroup.name),
        },
      },
    });
    const newMuscleGroups = muscleGroups.filter(
      (muscleGroup) =>
        !findMuscleGroups.map((m) => m.name).includes(muscleGroup.name)
    );

    const promises = newMuscleGroups.map((muscleGroup) =>
      this.muscleGroups.create({
        data: {
          ...muscleGroup,
        },
      })
    );
    const createdMuscleGroups = await Promise.all(promises);
    return [...findMuscleGroups, ...createdMuscleGroups];
  }
}

export default MuscleGroupService;
