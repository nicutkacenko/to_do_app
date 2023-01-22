<?php

namespace App\Http\Controllers;

use App\Models\ToDoComponent;
use Illuminate\Http\Request;

class ToDoComponentController extends Controller
{
    /**
     * Display a listing of the ToDoComponents.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $todocomponents = ToDoComponent::all();

        return view('todocomponents.index', compact('todocomponents'));
    }

    /**
     * Show the form for creating a new ToDoComponent.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('todocomponents.create');
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
     * @param  \App\Model\ToDoComponent  $todocomponent
     * @return \Illuminate\Http\Response
     */
    public function show(ToDoComponent $todocomponent)
    {
        return view('todocomponents.show', compact('todocomponent'));
    }

    /**
     * Show the form for editing the specified ToDoComponent.
     *
     * @param  \App\Model\ToDoComponent  $todocomponent
     * @return \Illuminate\Http\Response
     */
    public function edit(ToDoComponent $todocomponent)
    {
        return view('todocomponents.edit', compact('todocomponent'));
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
