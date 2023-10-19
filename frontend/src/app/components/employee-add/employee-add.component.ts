import { Component, NgZone } from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { Employee } from 'src/app/models/employee.model';
import { EmployeeService } from 'src/app/services/employee.service';

@Component({
  selector: 'app-employee-add',
  templateUrl: './employee-add.component.html',
  styleUrls: ['./employee-add.component.css'],
})
export class EmployeeAddComponent {
  employee: Employee = {
    perId: '',
    name: '',
    surname: '',
    address: '',
    mobile: '',
    email: '',
    sex: 'male',
    isActive: true,
  };
  submitted = false;

  constructor(
    private employeeService: EmployeeService,
    private router: Router,
    private ngZone: NgZone,
    protected _location: Location
  ) {}

  backPreviousPage(): void {
    this._location.back();
  }

  saveEmployee(): void {
    const data = {
      perId: this.employee.perId,
      name: this.employee.name,
      surname: this.employee.surname,
      address: this.employee.address,
      mobile: this.employee.mobile,
      email: this.employee.email,
      sex: this.employee.sex,
      isActive: this.employee.isActive,
    };

    this.employeeService.create(data).subscribe({
      next: (res) => {
        this.submitted = true;
        this.ngZone.run(() =>
          this.router.navigateByUrl('/')
        );
      },
      error: (e) => console.error(e),
    });
  }

  newEmployee(): void {
    this.submitted = false;
    this.employee = {
      perId: '',
      name: '',
      surname: '',
      address: '',
      mobile: '',
      email: '',
      sex: '',
      isActive: true,
    };
  }
}
