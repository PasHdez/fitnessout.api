import { IsString, IsUrl } from "class-validator";
import { CreateMuscleGroupDto } from "./muscleGroup.dto";

export class CreateExerciseDto {
  @IsString()
  public name: string;

  @IsString()
  public description: string;

  @IsUrl()
  public gifUrl: string;

  @IsUrl()
  public videoUrl: string;

  public muscleGroups: CreateMuscleGroupDto[];

  @IsString({ each: true })
  public categories: string[];
}
