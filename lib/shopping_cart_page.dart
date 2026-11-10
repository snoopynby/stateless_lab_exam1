import 'package:flutter/material.dart';

// ---------- Shared colors ----------
const Color kBlue = Color(0xFF2563EB);
const Color kLightBlue = Color(0xFFE3EEFF);
const Color kPageBg = Color(0xFFF3F4F6);
const Color kTextDark = Color(0xFF111827);
const Color kTextGrey = Color(0xFF6B7280);

// TODO: replace with your own full name
const String kStudentName = 'Novy Nicole Magtuba';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextDark),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kTextDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: kTextDark, size: 28),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: IgnorePointer(
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _IntroSection(),
              const SizedBox(height: 16),
              const _DeliveryCard(),
              const SizedBox(height: 20),
              const _OrderItemsHeader(),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse,
              ),
              const CartItemCard(
                name: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.usb,
              ),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_mac,
              ),
              const SizedBox(height: 4),
              const _DiscountBanner(),
              const SizedBox(height: 16),
              const _PaymentSummary(),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.lock_outline),
                  label: const Text(
                    'Place Order',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () =>
                      debugPrint('Place order clicked! Total: PHP 1850.00'),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- 2. Introduction ----------
class _IntroSection extends StatelessWidget {
  const _IntroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kBlue,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: kTextDark,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(fontSize: 14, color: kTextGrey),
        ),
      ],
    );
  }
}

// ---------- 3. Delivery card ----------
class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.location_on, color: kBlue),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to $kStudentName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: kTextDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(color: kTextGrey, fontSize: 13),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: const Text(
              'Change',
              style: TextStyle(color: kBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- 4. Order items header ----------
class _OrderItemsHeader extends StatelessWidget {
  const _OrderItemsHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kTextDark,
          ),
        ),
        Text('3 items', style: TextStyle(color: kTextGrey, fontSize: 14)),
      ],
    );
  }
}

// ---------- Reusable product card ----------
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: kBlue, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => debugPrint('Decrease quantity: $name'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: kBlue),
      ),
    );
  }
}

// ---------- 5. Discount banner ----------
class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.local_offer_outlined, color: kBlue),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: kTextGrey, fontSize: 13),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: kBlue),
        ],
      ),
    );
  }
}

// ---------- 6. Payment summary ----------
class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kTextDark,
            ),
          ),
          SizedBox(height: 14),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Discount (10%)', amount: '− PHP 200.00'),
          SizedBox(height: 10),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, thickness: 1),
          ),
          _SummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            bold: true,
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.amount,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? 18 : 14,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      color: bold ? kTextDark : kTextGrey,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(
          amount,
          style: bold ? style.copyWith(color: kBlue) : style,
        ),
      ],
    );
  }
}

// ---------- Shared card style ----------
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Color(0x14000000),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );
}