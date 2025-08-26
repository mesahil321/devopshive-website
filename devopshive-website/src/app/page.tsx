import Image from "next/image";

export default function HomePage() {
  return (
    <div className="container">
      <div className="title-container">
        <Image
          src="/rainbow.gif"
          alt="Rainbow"
          width={200}
          height={100}
          className="rainbow"
        />
        <h1 className="title">DevOpsHive</h1>
        <Image
          src="/bee.png"
          alt="Bee"
          width={60}
          height={60}
          className="bee-img top-left"
        />
        <Image
          src="/bee.png"
          alt="Bee"
          width={60}
          height={60}
          className="bee-img top-right"
        />
        <Image
          src="/bee.png"
          alt="Bee"
          width={60}
          height={60}
          className="bee-img bottom-left"
        />
        <Image
          src="/bee.png"
          alt="Bee"
          width={60}
          height={60}
          className="bee-img bottom-right"
        />
      </div>
    </div>
  );
}
