import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { faTrash } from '@fortawesome/free-solid-svg-icons';
import { faPen } from '@fortawesome/free-solid-svg-icons';
import { Employee } from 'src/app/models/employee.model';
import { EmployeeService } from 'src/app/services/employee.service';

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css'],
})
export class EmployeeListComponent implements OnInit {
  faPen = faPen;
  faTrash = faTrash;

  employees?: Employee[];
  currentEmployee: Employee = {};
  search_code = '';
  search_name = '';
  currentIndex = -1;
  title = '';
  currentUrl: any;

  constructor(
    private employeeService: EmployeeService,
    protected router: Router
  ) {}

  ngOnInit(): void {
    this.retrievesEmployees();
    // this.currentUrl = this.router.url.split('?')[0];
  }

  retrievesEmployees(): void {
    this.employeeService.getAll().subscribe({
      next: (data) => {
        this.employees = data;
      },
      error: (e) => console.error(e),
    });
  }

  refreshList(): void {
    this.retrievesEmployees();
    this.currentEmployee = {};
    this.currentIndex = -1;
  }

  clearSearch(): void {
    this.retrievesEmployees();
    this.search_code = '';
    this.search_name = '';
  }

  searchEmployees(): void {
    this.currentEmployee = {};
    this.currentIndex = -1;

    if (this.search_name) {
      this.employeeService.findByName(this.search_name).subscribe({
        next: (data) => {
          this.employees = data;
        },
        error: (e) => console.error(e),
      });
    } else {
      this.retrievesEmployees();
    }
  }

  deleteEmployee(id:any): void {
    this.employeeService.delete(id).subscribe({
      next: (res) => {
        this.refreshList();
      },
      error: (e) => console.error(e),
    });
  }
}
