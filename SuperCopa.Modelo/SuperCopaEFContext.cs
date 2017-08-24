namespace SuperCopa.Modelo
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class SuperCopaEFContext : DbContext
    {
        public SuperCopaEFContext()
            : base("name=SuperCopaEFContext")
        {
        }

        public virtual DbSet<Agente> Agentes { get; set; }
        public virtual DbSet<Atleta> Atletas { get; set; }
        public virtual DbSet<Equipe> Equipes { get; set; }
        public virtual DbSet<Treinador> Treinadores { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Agente>()
            //    .HasOptional(e => e.Atletas)
            //    .WithRequired(e => e.Agentes)
            //    .WillCascadeOnDelete();

            //modelBuilder.Entity<Agente>()
            //    .HasOptional(e => e.Treinadores)
            //    .WithRequired(e => e.Agentes)
            //    .WillCascadeOnDelete();

            modelBuilder.Entity<Atleta>()
                .Property(e => e.Altura)
                .HasPrecision(12, 2);

            modelBuilder.Entity<Atleta>()
                .Property(e => e.Peso)
                .HasPrecision(12, 2);

            modelBuilder.Entity<Equipe>()
                .HasMany(e => e.Atletas)
                .WithRequired(e => e.Equipes)
                .HasForeignKey(e => e.Equipe_Id)
                .WillCascadeOnDelete(false);

            //modelBuilder.Entity<Treinador>()
            //    .HasMany(e => e.Equipes)
            //    .WithRequired(e => e.Treinadores)
            //    .HasForeignKey(e => e.Treinador_Id)
            //    .WillCascadeOnDelete(false);
        }
    }
}
