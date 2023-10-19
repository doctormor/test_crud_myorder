import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Tbl_employees {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 13 })
  perId: string;
  @Column({ length: 150 })
  name: string;
  @Column({ length: 150 })
  surname: string;
  @Column()
  address: string;
  @Column({ length: 50 })
  mobile: string;
  @Column({ nullable: true })
  email: string;
  @Column({ length: 10 })
  sex: string;
  @Column({ default: true })
  isActive: boolean;
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updatedAt: Date;
}
