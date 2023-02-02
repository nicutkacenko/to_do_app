<?php

namespace App\Http\Controllers;

use App\Models\ToDoComponent;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\ToDoComponentResource;

class ToDoComponentController extends Controller
{
    /**
     * Display a listing of the ToDoComponents.
     * @return JsonResponse
     *
     */
    public function index(): JsonResponse
    {
        $todocomponents = ToDoComponent::all();
        return ToDoComponentResource::collection($todocomponents)->response();
    }

    /**
     * Store a newly created ToDoComponent in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'description' => 'required',
            'priority' => 'required|max:255',
            'image_url' => 'required|max:255'
        ]);

        $todocomponent = ToDoComponent::create($validatedData);

        return redirect('todocomponents')->with('success', 'ToDoComponent is successfully saved');
    }

    /**
     * Display the specified ToDoComponent.
     *
     * @param  int $id
     * @return JsonResponse
     */
    public function show($id)
    {
        $todocomponent = ToDoComponent::find($id);
        return new ToDoComponentResource($todocomponent);
    }

    /**
     * Update the specified ToDoComponent in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\ToDoComponent  $todocomponent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ToDoComponent $todocomponent)
    {
        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'description' => 'required|max:255',
            'priority' => 'required|max:255',
            'image_url' => 'required|max:255'
        ]);

        $todocomponent->update($validatedData);

        return redirect('todocomponents')->with('success', 'ToDoComponent is successfully updated');
    }

    /**
     * Remove the specified ToDoComponent from storage.
     *
     * @param  \App\Model\ToDoComponent  $todocomponent
     * @return \Illuminate\Http\Response
     */
    public function destroy(ToDoComponent $todocomponent)
    {
        $todocomponent->delete();

        return redirect('todocomponents')->with('success', 'ToDoComponent is successfully deleted');
    }
}
