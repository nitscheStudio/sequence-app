<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{Hash, Auth};

class RegisterController extends Controller
{
    public function __invoke(Request $request)
    {
        $validatedData = $request->validate([
            'username' => 'required|min:4|max:16|alpha_dash|unique:users',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => [
                'required',
                'min:8',
                'regex:/[a-z]/', // at least one lower case character
                'regex:/[A-Z]/', // at least one upper case character
                'regex:/[0-9]/', // at least one number
                'regex:/[!@#$%^&*(),.?":{}|<>]/', // at least one special character
                'regex:/^[^\s]+$/u', // no space allowed
                'confirmed', // matching password repeat
            ],
        ], [
            'password.required' => 'The password field is required.',
            'password.min' => 'The password must be at least 8 characters.',
            'password.regex' => 'The password must include at least one lowercase letter, one uppercase letter, one number, and one special character and should not contain spaces.',
            'password.confirmed' => 'The passwords do not match, please try again.',
        ]);

        $user = User::create([
            'username' => $validatedData['username'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        Auth::login($user);
        $request->session()->regenerate();

        return response()->json(["message" => "Registration successful!", "username" => $user->username], 201);
    }
}
