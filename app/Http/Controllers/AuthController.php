<?php

namespace App\Http\Controllers;

use Illuminate\Auth\Access\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class AuthController extends Controller
{
    // route guard from web.php
    public function routegateadmin() {
      return "Passing Through Admin-Only Route Gate";
    }
    public function routegateeditor() {
      return "Passing Through Editor-Only Route Gate";
    }
    public function routegateviewer() {
      return "Passing Through Viewer-Only Route Gate";
    }

    // controller guard
    public function controllergateadmin() {
      Gate::allows('isAdmin') ? Response::allow() : abort(403);
      return "Passing Through Admin-Only Controller Gate";
    }
    public function controllergateeditor() {
      Gate::allows('isEditor') ? Response::allow() : abort(403);
      return "Passing Through Editor-Only Controller Gate";
    }
    public function controllergateviewer() {
      Gate::allows('isViewer') ? Response::allow() : abort(403);
      return "Passing Through Viewer-Only Controller Gate";
    }
}
