import 'package:clover/model/cart_model.dart';
import 'package:clover/provider/cart_provider.dart';
import 'package:clover/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartModel cart;

  const CartTile({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
      ),
      width: double.infinity,
      height: 102,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: borderColor,
              image: DecorationImage(
                image: NetworkImage(
                  cart.product!.photos![0].url!,
                ),
              ),
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product!.name!,
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rp ${cart.product!.price!.round().toString()}',
                    style: greenTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartProvider.minQuantity(cart.id!);
                        },
                        child: Icon(
                          Icons.remove_circle,
                          color: kRedColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        cart.quantity.toString(),
                        style: greenTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          cartProvider.addQuantity(cart.id!);
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: kGreenColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeProduct(cart.id!);
            },
            child: Icon(
              Icons.delete_forever,
              size: 40,
              color: kRedColor,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
