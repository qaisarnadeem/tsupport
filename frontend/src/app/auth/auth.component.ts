import { Component, OnInit } from '@angular/core';

import { Angular2TokenService } from 'angular2-token';

@Component({
    selector: 'example',
    templateUrl: 'auth.component.html',
    styleUrls: ['auth.component.scss']
})
export class AuthComponent {

    private _showImprint: boolean = false;

    constructor(private _tokenService: Angular2TokenService) {

    }

}