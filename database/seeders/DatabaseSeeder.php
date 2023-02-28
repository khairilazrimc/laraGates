<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use App\Models\Post;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'name' => 'Dev',
            'email' => 'dev@gmail.com',
            'password' => bcrypt('password'),
            'role' => 'admin'
        ]);
        User::create([
            'name' => 'Pegawai',
            'email' => 'pegawai@gmail.com',
            'password' => bcrypt('password'),
            'role' => 'editor'
        ]);
        User::create([
            'name' => 'Public',
            'email' => 'public@gmail.com',
            'password' => bcrypt('password'),
            'role' => 'viewer'
        ]);

        Post::factory(8)->create();
    }
}
