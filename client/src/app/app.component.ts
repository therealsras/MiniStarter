import { UserService } from './core/services/user.service';
import { Component } from '@angular/core';
import { OverlayContainer } from '@angular/cdk/overlay';
import { LocalStorageService } from './core/services/local-storage.service';
import { MultilingualService } from './core/services/multilingual.service';
import { ThemeService } from './core/services/theme.service';
import { AccountService } from './core/services/account.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  themeVariant: string = '';
  darkModeIcon: string = '';
  constructor(private accountService: AccountService, private userService: UserService,
    private translationService: MultilingualService, private themeService: ThemeService, private overlay: OverlayContainer) {
  }

  ngOnInit(): void {
    this.loadCurrentUser();
    this.loadDefaults();
  }

  loadDefaults() {
    this.translationService.loadDefaultLanguage();
    this.themeService.setThemeFromLocalStorage();
  }

  loadCurrentUser() {
    this.accountService.loadCurrentUser().subscribe({
      next:(user) => this.userService.createHubConnection(),
      error:(err) => console.log(err)
    });
  }
}
