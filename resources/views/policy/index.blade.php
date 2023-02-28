@extends('layouts.app')

@section('content')
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <a href="{{ route('home') }}" class="btn btn-sm btn-dark mb-3">Back</a>
      <div class="card">
        <div class="card-header d-inline-flex pt-3">
          <h4>Post By {{ Auth::user()->name }}</h4>
        </div>
        
        <div class="card-body">
          
          {{-- @can parameter coming from app\Providers\AppServiceProvider.php --}}

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

          <table class="table">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Creator</th>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              
              @foreach ($posts as $post)
              <tr>
                <th scope="row">{{ $post->id }}</th>
                <td>{{ $post->user->name }}</td>
                <td>{{ $post->title }}</td>
                <td>{{ $post->description }}</td>
                <td>
                  
                  {{-- @can parameter coming from app\Policies\PostPolicy.php --}}
                  
                  @can('view', $post)
                    <a href="{{ route('post.show', $post) }}" class="btn btn-sm btn-warning">View</a>
                  @endcan

                  @can('delete', $post)
                    <a href="{{ route('post.delete', $post) }}" class="btn btn-sm btn-danger">Delete</a>
                  @endcan

                </td>
              </tr>
              @endforeach
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection