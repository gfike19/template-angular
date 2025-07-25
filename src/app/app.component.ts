import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CenterBody } from './center-body/center-body';
import { ComponentHeaderComponent } from "./component-header/component-header.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CenterBody, ComponentHeaderComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

}
