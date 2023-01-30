<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Http\Resources\ToDoComponentResource;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        ToDoComponentResource::withoutWrapping();
        Schema::defaultStringLength(191); /* add here */
    }
}
