export class CreateEmployeeDto {
  id: number;
  perId: string;
  name: string;
  surname: string;
  address: string;
  mobile: string;
  email: string;
  sex: string;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}
