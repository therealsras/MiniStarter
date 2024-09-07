import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-test-errors',
  templateUrl: './test-errors.component.html',
  styleUrls: ['./test-errors.component.scss']
})
export class TestErrorsComponent implements OnInit {
  baseUrl = environment.apiUrl;
  validationErrors: string[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
  }

  get404Error() {
    this.http.get(this.baseUrl + 'buggy/not-found').subscribe({
      next: (response) => console.log(response),
      error: (error) => console.log(error)
    })
  }

  get400Error() {
    this.http.get(this.baseUrl + 'buggy/bad-request').subscribe({
      next: (response) => console.log(response),
      error: (error) => console.log(error)
    })
  }

  get500Error() {
    this.http.get(this.baseUrl + 'buggy/server-error').subscribe({
      next: (response) => console.log(response),
      error: (error) => console.log(error)
    })
  }

  get401Error() {
    this.http.get(this.baseUrl + 'buggy/unauthorised').subscribe({
      next: (response) => console.log(response),
      error: (error) => console.log(error)
    })
  }

  get400ValidationError() {
    this.http.get(this.baseUrl + 'buggy/validation-error', {}).subscribe({
      next: (response) => console.log(response),
      error: (error) => {
        console.log(error)
        this.validationErrors = error
      }
    })
  }

}
