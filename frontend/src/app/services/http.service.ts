import { Injectable } from '@angular/core';
import { Request, XHRBackend, RequestOptions, Response, Http, RequestOptionsArgs, Headers } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Router } from '@angular/router';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';

@Injectable()
export class HttpService extends Http {
    constructor(backend: XHRBackend, defaultOptions: RequestOptions, private router: Router) {
        super(backend, defaultOptions);
    }
    request(url: string | Request, options?: RequestOptionsArgs): Observable<Response> {
        return super.request(url, options).catch(this.catchErrors());
    }
    private catchErrors() {
        return (res: Response) => {
            if (res.status === 401 || res.status === 403) {
                // handle authorization errors
                // I am navigating to logout route which brings the login screen for unautherised response
                this.router.navigate(['session/sign-in']);
            }
            if(res.status == 404 || res.status == 500 || res.status == 504){ //Not found or 500 , 504
                this.router.navigate([res.status.toString()])
            }
            return Observable.throw(res);
        };
    }
}