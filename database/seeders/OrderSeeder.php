<?php

namespace Database\Seeders;

use App\Models\Order;
use App\Models\Product;
use App\Models\RajaOngkirCourier;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::first();
        $courier = RajaOngkirCourier::first();
        $products = Product::all();

        if (! $user || ! $courier || $products->isEmpty()) {
            return;
        }

        $orders = [
            [
                'payment_status' => 'paid',
                'items' => [
                    ['product' => 'Fresh Apple Fuji', 'qty' => 2],
                    ['product' => 'Organic Carrot', 'qty' => 1],
                ],
            ],
            [
                'payment_status' => 'pending',
                'items' => [
                    ['product' => 'Imported Broccoli', 'qty' => 1],
                ],
            ],
            [
                'payment_status' => 'waiting',
                'items' => [
                    ['product' => 'Local Banana Cavendish', 'qty' => 3],
                ],
            ],
        ];

        foreach ($orders as $data) {
            $total = 0;

            $order = Order::create([
                'user_id' => $user->id,
                'courier_id' => $courier->id,
                'payment_status' => $data['payment_status'],
                'payment_booking_code' => strtoupper(Str::random(10)),
                'payment_url' => 'https://payment-gateway.test/pay',
                'total_price' => 0, // akan diupdate
            ]);

            foreach ($data['items'] as $item) {
                $product = Product::where('name', $item['product'])->first();

                if (! $product) {
                    continue;
                }

                $order->orderItems()->create([
                    'product_id' => $product->id,
                    'quantity' => $item['qty'],
                    'price' => $product->price,
                ]);

                $total += $product->price * $item['qty'];
            }

            $order->update([
                'total_price' => $total,
            ]);
        }
    }
}
