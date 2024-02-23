<?php

namespace App\Observers;

use App\Models\User;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;



class UserObserver
{
    /**
     * Handle the User "created" event.
     */
    public function created(User $user): void
    {
        //
    }

    /**
     * Handle the User "updated" event.
     */
    public function updated(User $user): void
    {
        // Check if the profile picture path was changed
        if ($user->isDirty('profile_picture_path')) {
            // Re-index associated samples
            $user->samples->each->searchable();
        }
    }

    /**
     * Handle the User "deleted" event.
     */

    public function deleted(User $user): void
    {
        Log::info("Deleting user: {$user->id}");
    
        // Ensure samples are loaded
        $user->load('samples'); 
    
        // Iterate over each sample associated with the user
        $user->samples->each(function($sample) {
            Log::info("Processing sample for deletion: {$sample->id}");
    
            // Delete the associated file from storage
            if (Storage::disk('public')->exists($sample->file_path)) {
                Storage::disk('public')->delete($sample->file_path);
                Log::info("Deleted file for sample: {$sample->id} at path: {$sample->file_path}");
            } else {
                Log::warning("File for sample: {$sample->id} does not exist at path: {$sample->file_path}");
            }
    
        });
    
        Log::info("Completed deleting user and their associated samples: {$user->id}");
    }
    

    /**
     * Handle the User "restored" event.
     */
    public function restored(User $user): void
    {
        //
    }

    /**
     * Handle the User "force deleted" event.
     */
    public function forceDeleted(User $user): void
    {
        //
    }
}
