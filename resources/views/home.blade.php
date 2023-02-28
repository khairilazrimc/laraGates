@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header d-inline-flex pt-3">
                  <h4>{{ __('Dashboard') }}</h4>
                </div>

                <div class="card-body">
                    
                  @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{-- can parameter coming from app\Providers\AppServiceProvider.php --}}

                    @can('isAdmin')
                      <small>Account Type: Admin</small>
                    @endcan

                    @can('isEditor')
                      <small>Account Type: Editor</small>
                    @endcan
                    
                    @can('isViewer')
                      <small>Account Type: Viewer</small>
                    @endcan

                    <br><br>

                    <h6>Route Gate</h6>
                    <a href="{{ route('routegate.admin') }}" class="btn btn-dark btn-sm">Admin</a>
                    <a href="{{ route('routegate.editor') }}" class="btn btn-dark btn-sm">Editor</a>
                    <a href="{{ route('routegate.viewer') }}" class="btn btn-dark btn-sm">Viewer</a>
                    
                    <br><br>
                    <h6>Controller Gate</h6>
                    <a href="{{ route('controllergate.admin') }}" class="btn btn-dark btn-sm">Admin</a>
                    <a href="{{ route('controllergate.editor') }}" class="btn btn-dark btn-sm">Editor</a>
                    <a href="{{ route('controllergate.viewer') }}" class="btn btn-dark btn-sm">Viewer</a>

                    <br><br>
                    <h6>Posts</h6>
                    <a href="{{ route('post.index') }}" class="btn btn-dark btn-sm">See Posts</a>

                  </div>
            </div>
        </div>
    </div>
</div>
@endsection
