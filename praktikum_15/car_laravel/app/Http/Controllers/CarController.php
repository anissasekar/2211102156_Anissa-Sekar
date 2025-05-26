<?php

namespace App\Http\Controllers;

use App\Models\Car;
use App\Models\Merk;
use Illuminate\Http\Request;

class CarController extends Controller
{
    /**
     * Tampilkan daftar semua mobil.
     */
    public function index()
    {
        $cars = Car::with('merk')->get();
        return view('car.index', compact('cars'));
    }

    /**
     * Tampilkan form untuk menambahkan mobil baru.
     */
    public function create()
    {
        $merks = Merk::all();
        return view('car.create', compact('merks'));
    }

    /**
     * Simpan data mobil baru.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'merk_id' => 'required|exists:merks,id',
            'model'   => 'required',
            'color'   => 'required',
            'year'    => 'required|numeric',
            'price'   => 'required|numeric',
            'image'   => 'required|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('car_images', 'public');
        }

        Car::create($data);

        return redirect()->route('car.index')->with('message', 'Car added successfully!');
    }

    /**
     * Tampilkan detail mobil.
     */
    public function show($id)
    {
        $car = Car::with('merk')->findOrFail($id);
        return view('car.show', compact('car'));
    }

    /**
     * Tampilkan form edit mobil.
     */
    public function edit($id)
    {
        $car = Car::findOrFail($id);
        $merks = Merk::all();
        return view('car.edit', compact('car', 'merks'));
    }

    /**
     * Proses update data mobil.
     */
    public function update(Request $request, $id)
    {
        $car = Car::findOrFail($id);

        $data = $request->validate([
            'merk_id' => 'required|exists:merks,id',
            'model'   => 'required',
            'color'   => 'required',
            'year'    => 'required|numeric',
            'price'   => 'required|numeric',
            'image'   => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('car_images', 'public');
        }

        $car->update($data);

        return redirect()->route('car.index')->with('message', 'Car updated successfully!');
    }

    /**
     * Hapus data mobil.
     */
    public function destroy($id)
    {
        $car = Car::findOrFail($id);
        $car->delete();

        return redirect()->route('car.index')->with('message', 'Car deleted successfully!');
    }
}
