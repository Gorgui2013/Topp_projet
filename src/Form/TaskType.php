<?php

namespace App\Form;

use App\Entity\Task;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use App\Entity\Step;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class TaskType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('name', TextType::class, ['required' => true])
        ->add('description', TextareaType::class, ['required' => true])
        ->add('begin', DateType::class, ['required' => true,'html5' => true, 'widget' => 'single_text'])
        ->add('end', DateType::class, ['required' => true,'html5' => true, 'widget' => 'single_text'])
        // ->add('step', EntityType::class, [
        //     'class' => Step::class,
        //     'choice_label' => 'name'
        // ])
        ->add('submit', SubmitType::class, ['label' => 'Enregirter'])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Task::class,
        ]);
    }
}
