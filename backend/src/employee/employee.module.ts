import { Module } from '@nestjs/common';
import { EmployeeService } from './employee.service';
import { EmployeeController } from './employee.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Tbl_employees } from './entities/employee.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Tbl_employees])],
  controllers: [EmployeeController],
  providers: [EmployeeService],
})
export class EmployeeModule {}
