namespace SuperCopa.Modelo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Atletas")]
    public partial class Atleta:Agente
    {
   
        public decimal? Altura { get; set; }

        [StringLength(30)]
        public string PosicaoPrincipal { get; set; }

        public decimal? Peso { get; set; }

        public DateTime? DataNascimento { get; set; }

        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        //public int Id { get; set; }

        public int Equipe_Id { get; set; }

        public virtual Agente Agentes { get; set; }

        public virtual Equipe Equipes { get; set; }
    }
}
