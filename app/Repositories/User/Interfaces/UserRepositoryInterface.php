<?php

namespace App\Repositories\User\Interfaces;

use App\Models\User;

interface UserRepositoryInterface
{
    /**
     * Get all User records.
     */
    public function getAll();

    /**
     * Create a new User record.
     * 
     * @param array $data
     */
    public function create(array $data);

    /**
     * Find a record User by ID.
     * 
     * @param int $id
     */
    public function findById(int $id);

    /**
     * Update a record User by ID.
     * 
     * @param int $id
     * @param array $data
     */
    public function updateById(int $id, array $data);

    /**
     * Delete a record User by ID.
     * 
     * @param int $id
     */
    public function deleteById(int $id);

    /**
     * Find user by email.
     *
     * @param string $email
     * @return User|null
     */
    public function findByEmail(string $email): ?User;

    /**
     * Update existing user or create a new one.
     *
     * @param array $attributes
     * @param array $values
     * @return User
     */
    public function updateOrCreate(array $attributes, array $values = []): User;
}
