import { Component, OnInit } from '@angular/core';
import  {Router}  from  '@angular/router'

import { Angular2TokenService } from 'angular2-token';

@Component({
    selector: 'restricted',
    templateUrl: 'restricted.component.html'
})
export class RestrictedComponent {
    constructor(router: Router){
        router.navigateByUrl(localStorage.getItem('redirectTo') || '/');
    }
}
