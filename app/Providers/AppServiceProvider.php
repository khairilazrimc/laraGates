<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{

    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // $this->registerPolicies();

        Gate::define('isAdmin', function($user) {
          return $user->role == 'admin';
        });
        Gate::define('isEditor', function($user) {
          return $user->role == 'editor';
        });
        Gate::define('isViewer', function($user) {
          return $user->role == 'viewer';
        });

    }
}
