<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;



class LogoutController extends Controller
{
    public function __invoke(Request $request)
    {
        // Auth::logout();
        Auth::guard('web')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json(['message' => 'Log out successfully'], 204);
    }
}
