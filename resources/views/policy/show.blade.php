@extends('layouts.app')

@section('content')
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <a href="{{ route('post.index') }}" class="btn btn-sm btn-dark mb-3">Back</a>
      <div class="card">
        <div class="card-header pt-3">
          <b>{{ $post->title }}</b>
          <h6><small>Post by {{ $post->user->name }}</small></h6>
        </div>
        <div class="card-body">
          {{ $post->description }}
        </div>
      </div>
    </div>
  </div>
</div>
@endsection