import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { AccountService } from './account.service';
import { AdminRouteGuard } from './admin-route-guard';
import { AuthInterceptorService } from './auth-interceptor.service';
import { AuthService } from './auth-service.component';
import { ProjectService } from './project.service';

@NgModule({
    imports: [],
    exports: [],
    declarations: [],
    providers: [
      AuthService,
      AccountService,
      ProjectService,
      AdminRouteGuard,
      { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptorService, multi: true }
    ],
})
export class CoreModule { }
