import { Component, Input, OnInit, NgZone } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Location } from '@angular/common';
import { Employee } from 'src/app/models/employee.model';
import { EmployeeService } from 'src/app/services/employee.service';


@Component({
  selector: 'app-employee-detail',
  templateUrl: './employee-detail.component.html',
  styleUrls: ['./employee-detail.component.css']
})
export class EmployeeDetailComponent implements OnInit {
  @Input() viewMode = false;

  @Input() currentEmployee: Employee = {
    perId: '',
    name: '',
    surname: '',
    address: '',
    mobile: '',
    email: '',
    sex: '',
    isActive: true,
  };

  message = '';

  constructor(
    private employeeService: EmployeeService,
    private route: ActivatedRoute,
    private router: Router,
    private ngZone: NgZone,
    protected _location: Location
  ) {}

  ngOnInit(): void {
    if (!this.viewMode) {
      this.message = '';
      this.getEmployee(this.route.snapshot.params['id']);
    }
  }

  backPreviousPage(): void {
    this._location.back();
  }

  getEmployee(id: string): void {
    this.employeeService.get(id).subscribe({
      next: (data) => {
        this.currentEmployee = data;
        console.log(data);
      },
      error: (e) => console.error(e),
    });
  }

  

  updateEmployee(): void {
    this.message = '';

    this.employeeService
      .update(this.currentEmployee.id, this.currentEmployee)
      .subscribe({
        next: (res) => {
          this.message = res.message
            ? res.message
            : 'This Employee was updated successfully!';
          this.ngZone.run(() => this.router.navigateByUrl(''));
        },
        error: (e) => console.error(e),
      });
  }
}
