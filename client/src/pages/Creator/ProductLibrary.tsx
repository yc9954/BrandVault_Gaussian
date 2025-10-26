import { useState, useEffect } from 'react';
import { fetchAllProducts, Product } from '../../api/productApi'; 

function ProductLibrary() {
  // 2. State 변수 선언: [데이터, 로딩상태, 에러]
  const [products, setProducts] = useState<Product[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchAllProducts()
      .then(data => {
        setProducts(data);
      })
      .catch((err: Error) => {
        setError(err.message);
      })
      .finally(() => {
        setIsLoading(false);
      });
  }, []);

  if (isLoading) {
    return <div>데이터를 불러오는 중입니다... ⏳</div>;
  }

  if (error) {
    return <div>에러가 발생했습니다: {error} ❌</div>;
  }

  return (
    <div>
      <h2>프라덕트 라이브러리 🛍️</h2>
      {products.length === 0 ? (
        <p>등록된 제품이 없습니다.</p>
      ) : (
        <ul style={{ listStyle: 'none', padding: 0 }}>
          {products.map((product) => (
            <li key={product.product_id} style={{ border: '1px solid #ccc', margin: '10px', padding: '10px' }}>
              <h3>{product.product_name}</h3>
              <p>브랜드: {product.brand.brand_name}</p>
              <p>카테고리: {product.category}</p>
              {product.color && <p>색상: {product.color}</p>}
              {product.size && <p>사이즈: {product.size}</p>}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default ProductLibrary;