import { IsString } from "class-validator";

export class CreateMuscleGroupDto {
  @IsString()
  public name: string;
}
