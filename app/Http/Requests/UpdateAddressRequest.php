<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAddressRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'label_name' => ['sometimes', 'string', 'max:50'],
            'recipient_name' => ['sometimes', 'string', 'max:255'],
            'phone_number' => ['sometimes', 'regex:/^(\+62|0)[0-9]{9,12}$/'],
            'province_id' => ['sometimes', 'integer', 'exists:raja_ongkir_provinces,id'],
            'city_id' => ['sometimes', 'integer', 'exists:raja_ongkir_cities,id'],
            'address' => ['sometimes', 'string', 'max:500'],
            'note_for_courier' => ['nullable', 'string', 'max:255'],
            'is_default' => ['boolean'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     */
    public function messages(): array
    {
        return [
            'phone_number.regex' => 'Please enter a valid Indonesian phone number (starting with +62 or 0).',
            'province_id.exists' => 'The selected province is invalid.',
            'city_id.exists' => 'The selected city is invalid.',
        ];
    }
}
