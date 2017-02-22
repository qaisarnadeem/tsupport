import { Injectable  , OnInit} from '@angular/core';
import { Angular2TokenService } from 'angular2-token';
import { CanActivate, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import  {User} from './user'
@Injectable()
export class UserService implements CanActivate{
    user: User = new User();
    constructor(private _tokenService: Angular2TokenService,private router: Router) {
        this._tokenService.init({signInRedirect: 'session/sign-in',
            signInStoredUrlStorageKey: 'redirectTo',signOutFailedValidate: true
        });
    }

    get current_user(): User{
        return this.user.load_from_json(this._tokenService.currentUserData);
    }

    canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        if (this._tokenService.userSignedIn()) {
            return true;
        }
        localStorage.setItem('redirectTo', window.location.pathname + window.location.search);
        this.router.navigate(['/']);
        return false;
    }
}
