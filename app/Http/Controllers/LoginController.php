<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function __invoke(Request $request)
    {
        // Initial validation for login and password
        $request->validate([
            'login' => 'required|string',
            'password' => 'required',
        ]);

        // Determine if the login is an email or username
        $fieldType = 'username';
        $loginInput = $request->login;

        if (filter_var($loginInput, FILTER_VALIDATE_EMAIL)) {
            // Additional validation for email format
            $request->validate(['login' => 'email']);
            $fieldType = 'email';
        }

        $credentials = [$fieldType => $loginInput, 'password' => $request->password];

        // Attempt to authenticate the user
        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            $userWithSamplesCount = User::where('id', $user->id)
            ->withCount('samples as samplesCount') // Assuming the relationship is named 'samples'
            ->first();

            return response()->json([
                'user' => $userWithSamplesCount,
                'message' => 'Login successful'
            ], 200);
        }

        // Handle failed login attempt
        $error = ['errors' => ['root' => ['Invalid Login Credentials. Please try again.']]];

        return response()->json(status: 401, data: $error);
    }
}
